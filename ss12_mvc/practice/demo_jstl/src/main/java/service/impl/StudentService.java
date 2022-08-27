package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService  implements IStudentService {
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
        // validate dữ liêu ở đây
        return studentRepository.add(student);
    }
}
