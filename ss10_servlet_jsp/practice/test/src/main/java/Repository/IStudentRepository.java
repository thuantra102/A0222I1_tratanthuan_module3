package Repository;

import Model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    Student findBy(int id);
    boolean add(Student student);

}
