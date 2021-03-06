package com.example.demo.service;

import com.example.demo.model.Blog;

import java.util.List;

public interface IBlogService {
    public List<Blog> findAll();

    public Blog findById(Integer id);

    void save(Blog blog);

    public void delete(Integer id);
}
