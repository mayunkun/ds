package cn.com.service;

import java.util.List;

public interface IBaseService<T> {

	public List<T> getList(T pojo, Integer page, Integer size, String orderby);

	public List<T> getList(T pojo);

	public int getListCount(T pojo);

	/**
	 * 根据id获取列表
	 * 
	 * @param pojo
	 * @return
	 */
	public T selectByPrimaryKey(T pojo);

	/**
	 * 根据id删除
	 * 
	 * @param T
	 */
	public int delete(T pojo);

	/**
	 * 新增
	 * 
	 * @param T
	 */
	public int insert(T pojo);

	/**
	 * 更新
	 * 
	 * @param T
	 */
	public int update(T pojo);

}
