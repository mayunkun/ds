package cn.com.manager;

import java.util.Collection;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 对在线用户的管理
 * 
 * @version 1.0
 */
public class ClientManager {

	private static ClientManager instance = new ClientManager();

	private ClientManager() {
	}

	public static ClientManager getInstance() {
		return instance;
	}

	private Map<String, Client> map = new ConcurrentHashMap<String, Client>();

	/**
	 * 第一个参数 userid， 第二个参数 sessionId
	 */
	private Map<String, String> sessionIDMap = new ConcurrentHashMap<String, String>();

	/**
	 * 
	 * @param sessionId
	 * @param client
	 */
	public void addClinet(String sessionId, Client client) {
		map.put(sessionId, client);
	}

	/**
	 * 
	 * @param userId
	 * @param sessionId
	 */
	public void addSessionMap(String userId, String sessionId) {
		sessionIDMap.put(userId, sessionId);
	}

	/**
	 * sessionId
	 */
	public void removeClinet(String sessionId) {
		map.remove(sessionId);
	}

	public void removeSessionMap(String userId) {
		sessionIDMap.remove(userId);
	}

	/**
	 * 
	 * @param sessionId
	 * @return
	 */
	public Client getClient(String sessionId) {
		return map.get(sessionId);
	}

	/**
	 * 
	 * @return
	 */
	public Collection<Client> getAllClient() {
		return map.values();
	}

	/**
	 * isOnline-用于判断用户是否在线
	 * 
	 * @return boolean-该用户是否在线的标志
	 */
	public boolean isOnline(String userId) {
		if (sessionIDMap.containsKey(userId)) {
			return true;
		} else {
			return false;
		}
	}

	public Map<String, Client> getMap() {
		return map;
	}

	public void setMap(Map<String, Client> map) {
		this.map = map;
	}

	public Map<String, String> getSessionIDMap() {
		return sessionIDMap;
	}

	public void setSessionIDMap(Map<String, String> sessionIDMap) {
		this.sessionIDMap = sessionIDMap;
	}
}
