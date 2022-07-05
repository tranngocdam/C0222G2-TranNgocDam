package com.example.blog.repository;

import com.example.blog.model.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface IBlogRepository extends JpaRepository<Blog, Integer> {
    @Query(value = " select *  from blog ", nativeQuery = true)
    List<Blog> findAll();

    @Query(value = " select * from blog b where b.id = :id", nativeQuery = true)
    Blog getBlog(@Param("id") int id);

    @Query(value = "select * from blog where `name` like :keyword", nativeQuery = true,
            countQuery = "select count(*) from (select * from blog where `name` like :keyword) a")
    Page<Blog> findAllByName(@Param("keyword") String keyword, Pageable pageable);

    @Query(value = "select * from blog where catagory_id = :id", nativeQuery = true)
    List<Blog> findAllCategoryId(@Param("id") int id);
}
