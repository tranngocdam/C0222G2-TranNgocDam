package com.example.blog.controller;

import com.example.blog.model.Blog;
import com.example.blog.service.IBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RequestMapping("/blogRest")
@RestController
@CrossOrigin
public class BlogRestController {
    @Autowired
    private IBlogService blogService;

    @GetMapping("/list")
    public ResponseEntity<Page<Blog>> showAllBlog(@PageableDefault(value = 5) Pageable pageable,
                                                  @RequestParam(name = "keyword") Optional<String> keyword) {
        String keywordVal = keyword.orElse("");
        Page<Blog> blogPage = this.blogService.findAllByName(keywordVal,pageable);
        if (!blogPage.hasContent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(blogPage,HttpStatus.OK);
    }
}
