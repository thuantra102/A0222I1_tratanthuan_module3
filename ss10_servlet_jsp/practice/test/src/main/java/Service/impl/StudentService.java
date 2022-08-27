package Service.impl;

import Model.Student;
import Repository.IStudentRepository;
import Repository.impl.StudentRepository;
import Service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Student findBy(int id) {
        return null;
    }

    @Override
    public boolean add(Student student) {

        return studentRepository.add(student);
    }
}
