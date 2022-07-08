package com.codegym.case_study.controller;

import com.codegym.case_study.model.Facility;
import com.codegym.case_study.service.IFacilityService;
import com.codegym.case_study.service.IFacilityTypeService;
import com.codegym.case_study.service.IRentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/facility")
public class FacilityController {
    @Autowired
    private IFacilityService iFacilityService;
    @Autowired
    private IFacilityTypeService iFacilityTypeService;
    @Autowired
    private IRentTypeService iRentTypeService;

    @GetMapping
    public String showFacility(@RequestParam Optional<String>keyword ,@PageableDefault(value = 5)Pageable pageable, Model model) {
        String keywordVal=keyword.orElse("");
        model.addAttribute("facilitys", this.iFacilityService.findFacilityByName(keywordVal, pageable));
        model.addAttribute("iFacilityTypeService", iFacilityTypeService.findAll());
        model.addAttribute("iRentTypeService", iRentTypeService.findAll());
        model.addAttribute("keyword", keywordVal);
        return "facility/list";
    }
    @GetMapping(value = "/createHouse")
    public String showCreateHouse(Model model){
        model.addAttribute("facilitys", new Facility());
        model.addAttribute("iFacilityTypeService", iFacilityTypeService.findAll());
        model.addAttribute("iRentTypeService", iRentTypeService.findAll());
        return "/facility/createHouse";
    }
    @PostMapping("/createHouse")
    public String createHouse(@ModelAttribute Facility facility, RedirectAttributes redirectAttributes) {
        iFacilityService.save(facility);
        return "redirect:/facility";
    }

    @GetMapping(value = "/createRoom")
    public String showCreateRoom(Model model){
        model.addAttribute("facilitys", new Facility());
        model.addAttribute("iFacilityTypeService", iFacilityTypeService.findAll());
        model.addAttribute("iRentTypeService", iRentTypeService.findAll());
        return "facility/createRoom";
    }
    @PostMapping("/createRoom")
    public String createRoom(@ModelAttribute Facility facility, RedirectAttributes redirectAttributes) {
        iFacilityService.save(facility);
        return "redirect:/facility";
    }

    @GetMapping(value = "/createVilla")
    public String showCreateVilla(Model model){
        model.addAttribute("facilitys", new Facility());
        model.addAttribute("iFacilityTypeService", iFacilityTypeService.findAll());
        model.addAttribute("iRentTypeService", iRentTypeService.findAll());
        return "facility/createVilla";
    }
    @PostMapping("/createVilla")
    public String createVilla(@ModelAttribute Facility facility, RedirectAttributes redirectAttributes) {
        iFacilityService.save(facility);
        return "redirect:/facility";
    }
    @GetMapping("/edit/{id}")
    public String showEdit(@PathVariable Integer id, Model model) {
        Facility facility=iFacilityService.findById(id);
        model.addAttribute("facilitys", facility);
        model.addAttribute("facilityType", iFacilityTypeService);
        model.addAttribute("rentType", iRentTypeService);
        return "facility/edit";
    }

    @PostMapping("/edit")
    public String Edit(@ModelAttribute("facility") Facility facility){
        iFacilityService.save(facility);
        return "redirect:/facility";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        iFacilityService.delete(id);
        return "redirect:/facility";
    }
}
