package com.yu.app.control;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yu.app.entity.Oil;
import com.yu.app.service.OilService;

@Controller
public class Control {

	@Autowired
	private OilService oilService;

	@RequestMapping("/list")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			Map<String, Object> map) {
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(pageNoStr);
			if (pageNo < 1) {
				pageNo = 1;
			}
		} catch (Exception e) {
		}
		Page<Oil> page = oilService.getPage(pageNo, 10);
		map.put("page", page);
		//System.out.println(page);
		return "list";
	}

	@ResponseBody
	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	public String validateLastName(@RequestParam(value = "keyid", required = true) String keyidstr,
			@RequestParam(value = "keyval", required = true) String keywordstr) {
		int keyid;
		int keyword;
		try {
			keyid = Integer.parseInt(keyidstr);
			keyword = Integer.parseInt(keywordstr);
			if (keyword < 100 || keyword > 500) {
				keyword = 100;
				return "0";
			}

		} catch (Exception e) {
			return "0";
		}

		System.out.println(keyid + "---" + keyword);
		Oil oil = oilService.get(keyid);
		oil.setCash(keyword);
		oilService.edit(oil);
		return "1";
	}

	@RequestMapping(value = "/add")
	public String input(Map<String, Object> map) {
		Oil oil = oilService.getLastOne();
		map.put("oil", oil);
		return "add";
	}

	@RequestMapping(value = "/doadd", method = RequestMethod.POST)
	public String save(Oil oil) {
		oilService.saveNew(oil);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/addByAjax", method = RequestMethod.GET)
	public String inputAjax(Map<String, Object> map) {
		Oil oil = oilService.getLastOne();
		map.put("oil", oil);
		return "addajax";
	}

	@ResponseBody
	@RequestMapping(value = "/getwithAjax")
	public Oil getwithAjax() {
		Oil oil = oilService.getLastOne();
		System.out.println(oil);
		return oil;
	}

	@ResponseBody
	@RequestMapping(value = "/savewithAjax", method = RequestMethod.POST)
	public String savewithAjax(@RequestParam(value = "mile", required = true) String milestr,
			@RequestParam(value = "cash", required = true) String cashstr,
			@RequestParam(value = "price", required = true) String pricestr) {

		int mile = 0;
		int cash = 0;
		double price = 0;

		try {
			mile = Integer.parseInt(milestr);
			cash = Integer.parseInt(cashstr);
			price = Double.parseDouble(pricestr);
			Oil oil = oilService.getLastOne();
			System.out.println(oil);
			if (mile < oil.getMile()) {
				return "0";
			}
			if (cash < 100 || cash > 650) {
				return "0";
			}
			if (price < 2) {
				return "0";
			}
			System.out.println(mile + "--" + cash + "--" + price);
			Oil oil2 = new Oil(mile, cash, price, null);
			oilService.saveNew(oil2);
			return "1";

		} catch (Exception e) {
			return "0";

		}

	}

}
