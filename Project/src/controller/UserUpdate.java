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
 * Servlet implementation class UserUpdate
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSessionインスタンスの取得
		HttpSession session = request.getSession();
		//フォワード
		if(session.getAttribute("user") != null) {
			User_dataDao usDao = new User_dataDao();
			User userUpdate = usDao.findById(request.getParameter("id"));
			request.setAttribute("userUpdate", userUpdate);
			request.setAttribute("updateUser", "ユーザー名：" + userUpdate.getName() + "さんを更新します。" );
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userUpdate.jsp");
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
		String id = request.getParameter("id");
		String login_id = request.getParameter("login-id");
		String userName = request.getParameter("user-name");
		String birth = request.getParameter("birth");
		String passwordBase = request.getParameter("password");
		String conformPassword = request.getParameter("conform-password");

		//データベースへ更新処理
		if(passwordBase.equals(conformPassword)){
			User_dataDao usDao = new User_dataDao();
			String password = null;
			try {
				password = encryption.passwordEncrypt(passwordBase);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			int i = usDao.updateOffer(login_id, userName, birth, password, id);
			if(i == 1) {
				request.setAttribute("updateCmp", "更新が完了しました。" );
				response.sendRedirect("/UserManagement/UserList");
			}else {
				request.setAttribute("updateFls", "更新に失敗しました。" );
				response.sendRedirect("/UserManagement/UserList");
			}
		}else {
			request.setAttribute("errorMessage", "再入力されたパスワードが違います。再度入力して下さい。");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/UserManagement/UserUpdate?id=" + id);
			dispatcher.forward(request, response);
		}
	}

}
