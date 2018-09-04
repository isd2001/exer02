package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class MessageDAO extends Dao{
	
	public int messageroom(String code,String sender,String receiver,String content,Date senddate) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into message(code,sender,receiver,content,senddate) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, sender);
			ps.setString(3, receiver);
			ps.setString(4, content);
			ps.setDate(5, senddate);
			int n =ps.executeUpdate();
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
		
	}
	
	public List<Map<String, String>> sendmessage(String receiver) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = " select * from message where receiver='"+receiver+"'";
			PreparedStatement ps = conn.prepareStatement(sql);
			//ps.setString(1, receiver);
			//int r= ps.executeUpdate();
			ResultSet rs = ps.executeQuery();

			List<Map<String, String>> ret = null ;
			//if (r==1) {
				if (rs.next()) {
					ret = new ArrayList<>();
					do {
						Map<String, String> one = new LinkedHashMap<>();
						one.put("content",rs.getString("content"));
						one.put("senddate",rs.getString("senddate"));
						one.put("sender",rs.getString("sender"));
						ret.add(one);
					}while(rs.next());
				}else {
					ret=null;
				}
			//}
			conn.close();
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}

}
