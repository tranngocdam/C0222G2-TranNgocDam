package case_study.controller;

import case_study.model.Facility;
import case_study.service.BookingService;
import case_study.service.CustomerService;
import case_study.service.EmployeeService;
import case_study.service.FacilityService;
import case_study.service.impl.BookingServiceImpl;
import case_study.service.impl.CustomerServiceImpl;
import case_study.service.impl.EmployeeServiceImpl;
import case_study.service.impl.FacilityServiceImpl;

import java.util.Scanner;

public class FuramaController {
    private static Scanner scanner=new Scanner(System.in);
    private static EmployeeService employeeService=new EmployeeServiceImpl();
    private static CustomerService customerService=new CustomerServiceImpl();
    private static FacilityService facilityService=new FacilityServiceImpl();
    private static BookingService bookingService=new BookingServiceImpl();
    public static void displayMainMenu(){
        while (true) {
            System.out.println("QUẢN LÍ FURAMA\n" +
                    "1. Employee Management\n" +
                    "2. Customer Management\n" +
                    "3. Facility Management \n" +
                    "4. Booking Management\n" +
                    "5. Promotion Management\n" +
                    "6. Exit");
            System.out.print("Please select: ");
            int choise = Integer.parseInt(scanner.nextLine());
            switch (choise) {
                case 1:
                    boolean check1=true;
                    while (check1) {
                        System.out.println("Employee Management\n" +
                                "1. Display list employees\n" +
                                "2. Add new employee\n" +
                                "3. Edit employee\n" +
                                "4. Return main menu");
                        System.out.print("Please select: ");
                        int choice1 = Integer.parseInt(scanner.nextLine());
                        switch (choice1) {
                            case 1:
                                employeeService.display();
                                break;
                            case 2:
                                employeeService.add();
                                break;
                            case 3:
                                employeeService.edit();
                                break;
                            case 4:
                                check1=false;
                                break;
                        }
                    }
                    break;
                case 2:
                    boolean check2=true;
                    while (check2) {
                        System.out.println("Customer Management\n" +
                                "1.\tDisplay list customers\n" +
                                "2.\tAdd new customer\n" +
                                "3.\tEdit customer\n" +
                                "4.\tReturn main menu");
                        System.out.print("Please select: ");
                        int choice2 = Integer.parseInt(scanner.nextLine());
                        switch (choice2) {
                            case 1:
                                customerService.display();
                                break;
                            case 2:
                                customerService.add();
                                break;
                            case 3:
                                employeeService.edit();
                                break;
                            case 4:
                                check2=false;
                                break;
                        }
                    }
                    break;
                case 3:
                    boolean check3=true;
                    while (check3) {
                        System.out.println("Facility Management\n" +
                                "1\tDisplay list facility\n" +
                                "2\tAdd new facility\n" +
                                "3\tDisplay list facility maintenance\n" +
                                "4\tReturn main menu");
                        System.out.print("Please select: ");
                        int choice3 = Integer.parseInt(scanner.nextLine());
                        switch (choice3) {
                            case 1:
                                facilityService.display();
                                break;
                            case 2:
                                facilityService.add();
                                break;
                            case 3:
                                facilityService.displayMainTenance();
                                break;
                            case 4:
                                check3=false;
                                break;
                        }
                    }
                    break;
                case 4:
                    boolean check4=true;
                    while (check4) {
                        System.out.println("Booking Managerment \n" +
                                "1.\tAdd new booking\n" +
                                "2.\tDisplay list booking\n" +
                                "3.\tCreate new constracts\n" +
                                "4.\tDisplay list contracts\n" +
                                "5.\tEdit contracts\n" +
                                "6.\tReturn main menu");
                        System.out.print("Please select: ");
                        int choice4 = Integer.parseInt(scanner.nextLine());
                        switch (choice4) {
                            case 1:
                                bookingService.add();
                                break;
                            case 2:
                                break;
                            case 3:
                                break;
                            case 4:
                                break;
                            case 5:
                                break;
                            case 6:
                                check4=false;
                                break;
                        }
                    }
                    break;
                case 5:
                    boolean check5=true;
                    while (check5) {
                        System.out.println("Promotion Management\n" +
                                "1.\tDisplay list customers use service\n" +
                                "2.\tDisplay list customers get voucher\n" +
                                "3.\tReturn main menu");
                        System.out.print("Please select: ");
                        int choice5 = Integer.parseInt(scanner.nextLine());
                        switch (choice5) {
                            case 1:
                                break;
                            case 2:
                                break;
                            case 3:
                                check5=false;
                                break;
                        }
                    }
                    break;
                case 6:
                    System.exit(0);
            }
        }

    }
}
