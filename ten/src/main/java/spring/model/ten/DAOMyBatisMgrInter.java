package spring.model.ten;

public interface DAOMyBatisMgrInter {
	public void create(Object dto) throws Exception;

	public void update(Object dto) throws Exception;

	public void delete(Object pk) throws Exception;

}
