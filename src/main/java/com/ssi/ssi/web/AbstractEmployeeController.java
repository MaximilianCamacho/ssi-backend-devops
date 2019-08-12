package com.ssi.ssi.web;

import com.ssi.ssi.security.Constants;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @autor Marco Herrera.
 */
@RequestMapping(value = AbstractEmployeeController.PATH)
public abstract class AbstractEmployeeController {

    public static final String PATH = Constants.EMPLOYEE_BASE_PATH;

    public static final String TAG_NAME = "Employee";

    public static final String DESCRIPTION = "Available operations over Employee ";
}
