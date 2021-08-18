package com.phonebook.dao;

import java.util.List;

import com.phonebook.vo.PhoneBookVO;

public interface PhoneBookDAO {
	public List<PhoneBookVO> getList();
	public List<PhoneBookVO> search(String keyword);
	public boolean insert(PhoneBookVO vo);
	public boolean delete(Long id);
}
