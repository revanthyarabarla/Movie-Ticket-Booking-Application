package com.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.sql.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminAddMovies
 */
@WebServlet("/AdminAddMovies")
public class AdminAddMovies extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "F:/workspace/MovieTicketBookingSystem/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String movie_name = null;
				String movie_certificate = null;
				String type = null;
				String duration = null;
				String language = null;
				String director = null;
				String cast = null;
				String description = null;
				String movie_price = null;
				int price = 0;
				HttpSession hs = request.getSession();

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem mname = (FileItem) multiparts.get(0);
						movie_name = mname.getString();
						System.out.println("Movie name==>> " + movie_name);

						FileItem certificate = (FileItem) multiparts.get(1);
						movie_certificate = certificate.getString();
						System.out.println("Certificate==>> " + movie_certificate);

						FileItem mType = (FileItem) multiparts.get(2);
						type = mType.getString();
						System.out.println("Movie type==>>" + type);

						FileItem mduratioin = (FileItem) multiparts.get(3);
						duration = mduratioin.getString();
						System.out.println("Movie duration==>>" + duration);

						FileItem mlanguage = (FileItem) multiparts.get(4);
						language = mlanguage.getString();
						System.out.println("Movie language==>>" + language);

						FileItem mdirector = (FileItem) multiparts.get(5);
						director = mdirector.getString();
						System.out.println("Movie director==>>" + director);

						FileItem mcast = (FileItem) multiparts.get(6);
						cast = mcast.getString();
						System.out.println("Movie Cast==>> " + cast);

						FileItem mprice = (FileItem) multiparts.get(7);
						movie_price = mprice.getString();
						price = Integer.parseInt(movie_price);
						System.out.println("Movie Price==>> " + movie_price);

						FileItem mdescription = (FileItem) multiparts.get(8);
						description = mdescription.getString();
						System.out.println("Movie description==>> " + description);

					}
				}
				try {
					int id = 0;
					String imagePath = UPLOAD_DIRECTORY + imageName;
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmovie where movie_name='" + movie_name + "'");
					if (resultset.next()) {
						String message = "Movie already exist";
						session.setAttribute("already-exist", message);
						response.sendRedirect("admin-add-movie.jsp");
					} else {
						int i = DatabaseConnection.insertUpdateFromSqlQuery(
								"insert into tblmovie(movie_id,movie_name,movie_certificate,type,language,duration,director,cast,description,movie_price,createdby,modifiedby,movie_image_name,movie_image) values('"
										+ id + "','" + movie_name + "','" + movie_certificate + "','" + type + "','"
										+ language + "','" + duration + "','" + director + "','" + cast + "','"
										+ description + "','" + price + "','" + hs.getAttribute("uname") + "','"
										+ hs.getAttribute("uname") + "','" + imageName + "','" + imagePath + "')");
						if (i > 0) {
							String success = "Movie added successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-add-movie.jsp");
						}

					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}
}
