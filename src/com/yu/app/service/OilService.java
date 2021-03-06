package com.yu.app.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yu.app.entity.Oil;
import com.yu.app.repository.OilRepository;

@Service
public class OilService {
	@Autowired
	private OilRepository oilRepository;

	@Transactional
	public void delete(Integer id) {
		oilRepository.delete(id);
	}

	@Transactional(readOnly = true)
	public Oil get(Integer id) {
		return oilRepository.findOne(id);
	}

	@Transactional(readOnly = true)
	public Oil getLastOne() {
		List<Oil> oils = oilRepository.findAll();
		Oil oil = oils.get(oils.size() - 1);
		return oil;
	}

	@Transactional
	public void saveNew(Oil oil) {
		oil.setId(-1);
		oil.setDate(new Date());
		oilRepository.saveAndFlush(oil);
	}

	@Transactional
	public void edit(Oil oil) {
		oilRepository.saveAndFlush(oil);
	}

	@Transactional(readOnly = true)
	public Page<Oil> getPage(int pageNo, int pageSize) {
		Sort sort = new Sort(Direction.DESC, "id");
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);
		return oilRepository.findAll(pageable);
	}
}
