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

/**
 * Servlet implementation class UserCreate
 */
@WebServlet("/UserCreate")
public class UserCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSessionインスタンスの取得
				HttpSession session = request.getSession();
				// フォワード
				if(session.getAttribute("user") != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
					dispatcher.forward(request, response);
				}else {
					response.sendRedirect("/UserManagement/Index");
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
		String login_id = request.getParameter("login-id");
		String userName = request.getParameter("user-name");
		String birth = request.getParameter("birth");
		String passwordBase = request.getParameter("password");
		String conformPassword = request.getParameter("conform-password");

		//データベースへ新規登録処理
		if(passwordBase.equals(conformPassword)){
			User_dataDao usDao = new User_dataDao();
			String password = null;
			try {
				password = encryption.passwordEncrypt(passwordBase);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}

			int i = usDao.insertOffer(login_id, userName, birth, password);
			if (i == 1) {
				request.setAttribute("complete", "ユーザー名：" + userName + "さんが登録されました。" );
				RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
				dispatch.forward(request, response);
			}else {
				request.setAttribute("falseMessage", "登録に失敗しました。" );
				RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
				dispatch.forward(request, response);
			}
		}else {
			request.setAttribute("errorMessage", "再入力されたパスワードが違います。再度入力して下さい。" );
			RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
			dispatch.forward(request, response);
		}
	}
}
