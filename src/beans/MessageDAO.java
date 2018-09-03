package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class MessageDAO extends Dao{
	
	public int messageroom(String sender,String receiver,String content,Date senddate) {
		String serial = UUID.randomUUID().toString().split("-")[0];
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into message values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			ps.setString(2, sender);
			ps.setString(3, receiver);
			ps.setString(4, content);
			ps.setDate(5, senddate);
			int n =ps.executeUpdate();
			conn.close();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
		
	}
	
	public List<Map<String, String>> sendmessage(String receiver,String sender,String senddate) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = " select * from message where receiver = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, receiver);
			int r= ps.executeUpdate();
			List<Map<String, String>> ret;
			if (r==1) {
				ret = new ArrayList<>();
				Map<String,String> send= new LinkedHashMap<>();
				send.put(sender, senddate);
				ret.add(send);
				return ret;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}

}
