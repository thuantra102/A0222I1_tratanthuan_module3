package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {

    private final String SELECT_ALL="select * from student;";
    private final String SEARCH="call search(?,?,?);";
    private final String DELETE_BY_ID=" delete from student where id =?;";
    private final String ADD_NEW ="insert into student(`name`, gender,birthday,`point`,`account`,class_id,email) values (?,?,?,?,?,?,?);";
    @Override
    public List<Student> findAll() {
        // kết nối DB để lấy dữ liệu
        List<Student> studentList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
             while (resultSet.next()){
                 int id = resultSet.getInt("id");
                 String name = resultSet.getString("name");
                 boolean gender = resultSet.getBoolean("gender");
                 String birthday = resultSet.getString("birthday");
                 int point = resultSet.getInt("point");
                 String account = resultSet.getString("account");
                 String email = resultSet.getString("email");
                 int classId = resultSet.getInt("class_id");
                 Student student = new Student(id,name,gender,birthday,point,account,classId,email);
                 studentList.add(student);
             }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public List<Student> search(String nameSearch, String accountSearch, String classIdSearch) {
        List<Student> studentList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH);
            callableStatement.setString(1,nameSearch);
            callableStatement.setString(2,accountSearch);
            callableStatement.setString(3,classIdSearch);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                String birthday = resultSet.getString("birthday");
                int point = resultSet.getInt("point");
                String account = resultSet.getString("account");
                String email = resultSet.getString("email");
                int classId = resultSet.getInt("class_id");
                Student student = new Student(id,name,gender,birthday,point,account,classId,email);
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public Student findBy(int id) {

        return null;
    }

    @Override
    public void add(Student student) {

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setDate(3, Date.valueOf(student.getBirthday()));
            preparedStatement.setInt(4,student.getPoint());
            preparedStatement.setString(5,student.getAccount());
            preparedStatement.setInt(6,student.getClassId());
            preparedStatement.setString(7,student.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean delete(int id) {
           Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1,id);
            int num =preparedStatement.executeUpdate();
            return (num==1);
//            if (num==1){
//                return true;
//            }else{
//                return false;
//            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public String transaction() {
        String msg = "OK, transaction successfully!";
        Connection connection = BaseRepository.getConnectDB();
        Savepoint savepoint1=null;
        Savepoint savepoint2=null;
        try {
            connection.setAutoCommit(false);
            // thêm mới 1 type_of_class
            PreparedStatement pSInsertTypeOfClass =
                    connection.prepareStatement(
                            "insert into class_type (id, `name`)\n" +
                                    "values (?, ?)");
            pSInsertTypeOfClass.setString(1, "7");
            pSInsertTypeOfClass.setString(2, "Other7");

            int rowAffect = pSInsertTypeOfClass.executeUpdate();

            savepoint1= connection.setSavepoint();
            // thêm mới 1 class
            PreparedStatement pSInsertClass =
                    connection.prepareStatement(
                            "insert into class (`name`, class_type_id)\n" +
                                    "values (?, ?)");
            pSInsertClass.setString(1, "C0922G1");
            pSInsertClass.setString(2, "1");

            rowAffect += pSInsertClass.executeUpdate();

            savepoint2= connection.setSavepoint();

            // thêm mới 1 học viên
            if (rowAffect == 2) {
                PreparedStatement pSInsertStudent
                        = connection.prepareStatement(
                        "insert into student(`name`, birthday, email, class_id) " +
                                "values (?, ?, ?, ?)");
                pSInsertStudent.setString(1, "Nguyen Thất Bại");
                pSInsertStudent.setString(2, "2021-09-28");
                pSInsertStudent.setString(3, "anguyen111@gmail.com");
                pSInsertStudent.setString(4, "1");

                rowAffect += pSInsertStudent.executeUpdate();
            }
            // kiểm tra nếu cả 3 hoạt động thêm mới thành công thì mới commit
            if (rowAffect == 3) {
                connection.commit();

            } else {
                msg = "rollback try";
                connection.rollback();
            }

        } catch (SQLException e) {
            try {
                msg = "rollback catch";
                connection.rollback();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return msg;
    }
}
