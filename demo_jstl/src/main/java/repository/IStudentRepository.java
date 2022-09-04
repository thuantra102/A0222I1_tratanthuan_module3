package repository;

import model.Student;

import java.util.List;
import java.util.Map;

public interface IStudentRepository {
    List<Student> findAll();
    List<Student> search(String name, String account, String classID);
    Student findBy(int id);
    void add(Student student);
    boolean delete(int id);
    String transaction();

}
