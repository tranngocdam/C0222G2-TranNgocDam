package com.codegym.blog.repository;

import com.codegym.blog.model.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface IBlogRepository extends JpaRepository<Blog, Integer> {
    public Page<Blog> findAllByAuthorContaining(String keyword, Pageable pageable);

    @Query(value = "SELECT * FROM blog JOIN blog_category ON blog.id = blog_category.blog_id " +
            " JOIN category ON category.id = blog_category.category_id " +
            " WHERE category_id = :id and author LIKE :author ORDER BY create_date ASC", nativeQuery = true)
    public Page<Blog> searchByAuthorAndType(@Param("author") String keyword, @Param("id")Long id, Pageable pageable);
}
