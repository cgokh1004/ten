package spring.model.member;

import org.springframework.beans.factory.annotation.Autowired;

import spring.model.ten.DAOMyBatisMgrInter;

public class MemberMgr implements DAOMyBatisMgrInter {
@Autowired
private MemberDAO memberDAO;
	@Override
	public void create(Object dto) throws Exception {
		memberDAO.create1((MemberDTO) dto);
		memberDAO.create2(((MemberDTO) dto).getId());

	}

	@Override
	public void update(Object dto) throws Exception {
		memberDAO.update1((MemberDTO) dto);
		memberDAO.update2(((MemberDTO) dto).getId());

	}

	@Override
	public void delete(Object pk) throws Exception {
		// TODO Auto-generated method stub

	}

}
