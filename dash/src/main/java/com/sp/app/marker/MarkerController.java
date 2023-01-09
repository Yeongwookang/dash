package com.sp.app.marker;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("marker.markerController")
@RequestMapping("/map/*")
public class MarkerController {

	@RequestMapping(value = "main")
	public String main() {

		return ".map.marker";
	}

}
