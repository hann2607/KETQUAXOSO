package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.model.DaySoMaVe;
import com.poly.model.Giai;

@Controller
public class KQXSController {
	String tinh = null;
	String ngay = null;
	String daySoInput = null;
	String message = null;
	boolean isDisableButton = true;
		
	@RequestMapping("/KQXS")
	public String home(Giai giai, ModelMap model) {
		// Lấy list giải thưởng về
		if (tinh != null && ngay != null) {
			model.addAttribute("tinh", tinh);
			model.addAttribute("ngay", ngay);
			tinh = null;
			ngay = null;
		}
		if(isDisableButton) {
			model.addAttribute("disableButton", "disabled");
			isDisableButton = false;
		}
		DaySoMaVe daySoModel = splitString();
		// Check list giải có null hay không
		if (giai.getTinh() != null && giai.getNgay() != null) {
			// Check người dùng đã nhập số hay chưa
			if (daySoInput != null && daySoModel != null) {
				// Check giải đặc biệt 
				if (giai.getGiaidb().contains(daySoModel.getNum6())) {
					message = "Chúc mừng bạn đã trúng giải đặc biệt!";
				} else if (giai.getGiai1().contains(daySoModel.getNum5())){
					// Check giải nhất
					message = "Chúc mừng bạn đã trúng giải nhất!";
				} else if (giai.getGiai2().contains(daySoModel.getNum5())){
					// Check giải nhì
					message = "Chúc mừng bạn đã trúng giải nhì!";
				} else if (giai.getGiai3().contains(daySoModel.getNum5())){
					// Check giải ba
					message = "Chúc mừng bạn đã trúng giải ba!";
				} else if (giai.getGiai4().contains(daySoModel.getNum5())){
					// Check giải bốn
					message = "Chúc mừng bạn đã trúng giải bốn!";
				} else if (giai.getGiai5().contains(daySoModel.getNum4())){
					// Check giải năm
					message = "Chúc mừng bạn đã trúng giải năm!";
				} else if (giai.getGiai6().contains(daySoModel.getNum4())){
					// Check giải sáu
					message = "Chúc mừng bạn đã trúng giải sáu!";
				} else if (giai.getGiai7().contains(daySoModel.getNum3())){
					// Check giải bảy
					message = "Chúc mừng bạn đã trúng giải bảy!";
				} else if (giai.getGiai8().contains(daySoModel.getNum2())){
					// Check giải tám
					message = "Chúc mừng bạn đã trúng giải tám!";
				} else {
					// Check không trúng giải
					message = "Chúc bạn may mắn lần sau!";
				}
			}
		}
		return "index";
	}

	@RequestMapping("/Result")
	public String Posted(ModelMap model, @RequestParam String chontinh, @RequestParam String chonngay,
			@RequestParam String mave) {
		tinh = "/" + chontinh;
		ngay = "/" + chonngay;
		daySoInput = mave;
		model.addAttribute("disableButton", "");
		return "redirect:/KQXS";
	}
	
	@RequestMapping("/ShowResult")
	public String showRS(ModelMap model) {
		model.addAttribute("messages", message);
		model.addAttribute("disableButton", "disabled");
		if(message == null || message.equalsIgnoreCase("Vui lòng dò kết quả trước khi hiển thị!")) {
			model.addAttribute("messages", "Vui lòng dò kết quả trước khi hiển thị!");
		} else {
			model.addAttribute("messages", message);
		}
		return "forward:/KQXS";
	}

	public DaySoMaVe splitString() {
		if (daySoInput != null) {
			DaySoMaVe daySoModel = new DaySoMaVe();
			daySoModel.setNum6(daySoInput);
			daySoModel.setNum5(daySoInput.substring(1));
			daySoModel.setNum4(daySoInput.substring(2));
			daySoModel.setNum3(daySoInput.substring(3));
			daySoModel.setNum2(daySoInput.substring(4));
			return daySoModel;
		}
		return null;
	}
}
