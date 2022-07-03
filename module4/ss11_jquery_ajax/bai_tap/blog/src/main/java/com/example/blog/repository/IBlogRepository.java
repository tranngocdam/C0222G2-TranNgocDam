package com.example.blog.repository;

import com.example.blog.model.Blog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface IBlogRepository extends JpaRepository<Blog, Long> {
    List<Blog> findBlogByCategoryName(String categoryName);
    List<Blog> findBlogByNameContaining(String name);
}
