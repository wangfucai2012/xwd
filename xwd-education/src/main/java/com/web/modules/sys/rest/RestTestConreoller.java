package com.web.modules.sys.rest;

import com.web.commons.web.BaseController;
import com.web.modules.sys.entity.User;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api/v1/test")
public class RestTestConreoller extends BaseController {

	public RestTestConreoller() {
	}

	@RequestMapping(value = { "/{id}" })
	public User getTest(@PathVariable("id") Long id) {
		User u = new User();
		u.setId(id);
		u.setName("test");
		u.setPassword("pwd");
		return u;
	}
}
