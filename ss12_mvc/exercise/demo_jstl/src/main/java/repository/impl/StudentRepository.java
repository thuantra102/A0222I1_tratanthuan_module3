package repository.impl;

import model.Student;
import repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1, "chanh", true, "12-12-2022", 9, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(2, "chanh2", false, "12-12-2022", 3, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(3, "chanh3", false, "12-12-2022", 8, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(4, "chanh4", true, "12-12-2022", 7, "chanhtv", 1, "chanhtv@gmail.com"));
        studentList.add(new Student(5, "chanh5", true, "12-12-2022", 6, "chanhtv", 1, "chanhtv@gmail.com"));
    }
    @Override
    public List<Student> findAll() {
        // kết nối DB để lấy dữ liệu
        return studentList;
    }

    @Override
    public Student findBy(int id) {

        return null;
    }

    @Override
    public boolean add(Student student) {
        studentList.add(student);
        return true;
    }

    @Override
    public boolean delete(int id) {
        for (int i = 0; i <studentList.size() ; i++) {
            if (studentList.get(i).getId()==id){
                studentList.remove(i);
                break;
            }
        }
        return true;
    }
}
