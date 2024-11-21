package com.abrar.usermanagement.dao;

//import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.abrar.usermanagement.bean.User;

public class UserDao {

	private String jdbcUrl = "jdbc:postgresql://localhost:5432/UserManagement";
	private String jdbcUsername = "postgres";
	private String jdbcPassword = "abrar";
	private String jdbcDriver = "org.postgresql.Driver";

	private static final String SELECT_ALL_USERS = "select * from users;";
	private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
	private static final String UPDATE_USERS_SQL = "update users set name = ?, email = ?, country = ? where id = ?;";
	private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES "
			+ " (?, ?, ?);";
	private static final String SELECT_USERS_BY_ID = "select id,name,email,country from users where id = ?;";

	public UserDao() {

	}

	protected Connection getDbConnection() throws ClassNotFoundException {
		Connection con_obj = null;

		try {
			Class.forName(jdbcDriver);
			System.out.println("At 38");
			con_obj = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

		} catch (Exception ob) {

			System.out.println("SQLException occured!!");
			ob.printStackTrace();
		}

		return con_obj;
	}

	// insert user
	public void insertUser(User user) {
		System.out.println(INSERT_USERS_SQL);

		try {
			Connection con_obj = getDbConnection();
			System.out.println(61);
			PreparedStatement prep = con_obj.prepareStatement(INSERT_USERS_SQL);

			prep.setString(1, user.getName());
			prep.setString(2, user.getEmail());
			prep.setString(3, user.getCountry());

			System.out.println(prep);

			prep.executeUpdate();

		} catch (Exception e) {
			System.out.println("SQL Exception in insertUser() !!");
			e.printStackTrace();
		}
	}

	// select all the users
	public List<User> selectAllUsers() {
		System.out.println(SELECT_ALL_USERS);
		List<User> list = new ArrayList<>();

		try {
			System.out.println("UP");
			Connection con_obj = getDbConnection();
			PreparedStatement stmt = con_obj.prepareStatement(SELECT_ALL_USERS);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");

				User temp = new User(id, name, email, country);
				list.add(temp);

			}
			for (User x : list) {
				System.out.println(x.toString());
			}

		} catch (Exception e) {
			System.out.println("SQL exception occcured in select all users()" + e.getMessage());
		}

		return list;
	}

	// select users by id
	public User selectUsersById(int id) {
		User user = null;

		System.out.println(SELECT_USERS_BY_ID);

		try {
			Connection con_obj = getDbConnection();

			PreparedStatement prep = con_obj.prepareStatement(SELECT_USERS_BY_ID);
			prep.setInt(1, id);

			System.out.println(prep);
			ResultSet rs = prep.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");

				user = new User(id, name, email, country);
			}

		} catch (Exception e) {
			System.out.println("SQL exception occured in select user by id meth()");
		}

		return user;
	}

	// update the users
	public boolean updateUser(User user) {
		boolean rowUpdated = false;
		try {
			Connection con_obj = getDbConnection();
			PreparedStatement prep = con_obj.prepareStatement(UPDATE_USERS_SQL);

			prep.setString(1, user.getName());
			prep.setString(2, user.getEmail());
			prep.setString(3, user.getCountry());

			prep.setInt(4, user.getId());

			rowUpdated = prep.executeUpdate() > 0;

		} catch (Exception e) {
			System.out.println("SQL exception coaught in update users()");
			e.printStackTrace();
		}

		return rowUpdated;
	}

	// delete the users by id
	public boolean deleteUser(int id) {
		boolean del = false;
		try {
			Connection con_obj = getDbConnection();
			PreparedStatement prep = con_obj.prepareStatement(DELETE_USERS_SQL);
			prep.setInt(1, id);
			del = prep.executeUpdate() > 0;
		} catch (Exception e) {
			System.out.println("SQL Exception caught in Delete user()");
		}

		return del;
	}

}
