package controller;


import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User_dataDao;
import model.User;
/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//HttpSessionインスタンスの取得
		HttpSession session = request.getSession();
		// フォワード
		if(session.getAttribute("user") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("/UserManagement/UserList");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータの文字コード指定
		request.setCharacterEncoding("UTF-8");

		//暗号化のためのインスタンス取得
		Encryption encryption = new Encryption();

		//リクエストパラメータの取得
		String login_id = request.getParameter("login_id");
		String password = null;
		try {
			password = encryption.passwordEncrypt(request.getParameter("password"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		//HttpSessionインスタンスの取得
		HttpSession session = request.getSession();

		//ログイン認証
		User_dataDao usDao = new User_dataDao();
		User user = usDao.loginProcess(login_id, password);
		session.setAttribute("user", user);
		if(user == null) {
			request.setAttribute("errorMessage", "ログインID、またはパスワードが違っています");
			RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
			dispatch.forward(request, response);
		}else {
			response.sendRedirect("/UserManagement/UserList");
		}
	}
}

