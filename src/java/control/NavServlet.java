package control;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Field;
import model.Product;

@WebServlet(name = "NavServlet", urlPatterns = {"/nav"})
public class NavServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NavServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NavServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = 0;
        ProductDAO pd = new ProductDAO();
        List<Product> list = new ArrayList<>();
        List<Field> leftnav = new ArrayList<>();
        String name = request.getParameter("name");
        int from = 0;
         int oid = 0;
        int to = 0;
         HttpSession session = request.getSession();
         List<Product> searchProducts = (List<Product>) session.getAttribute("searchProducts");
         if (searchProducts !=null){
             cid = searchProducts.get(0).getOproduct().getCategory();
             
         }

        try {

            cid = Integer.parseInt(request.getParameter("cid"));

        } catch (Exception e) {
            // Xử lý ngoại lệ (nếu cần)
        }
        try {
            from = Integer.parseInt(request.getParameter("from"));

        } catch (Exception e) {
        }
        try {
            to = Integer.parseInt(request.getParameter("to"));
        } catch (Exception e) {
        }
        if (cid == 0) {
            leftnav.add(new Field("Túi tote", "nav?cid=1"));
            leftnav.add(new Field("Dây buộc tóc", "nav?cid=2"));
            leftnav.add(new Field("Vòng cổ", "nav?cid=3"));
        } else if (cid == 1) {
            leftnav.add(new Field("Hình gấu", "nav?name=gấu"));
            leftnav.add(new Field("Hình hoa", "nav?name=hoa"));
            leftnav.add(new Field("Kẻ caro", "nav?name=caro"));
            leftnav.add(new Field("Kẻ sọc", "nav?name=sọc"));
            leftnav.add(new Field("Màu hồng", "nav?name=hồng"));
            leftnav.add(new Field("Màu trắng", "nav?name=trắng"));
            leftnav.add(new Field("Dưới 100.000 VND", "nav?to=99000"));
            leftnav.add(new Field("Từ 100.000 - 150.000 VND", "nav?from=100000&to=150000"));
        } else if (cid == 2) {
            leftnav.add(new Field("Có ren", "nav?name=ren"));
            leftnav.add(new Field("Hình hoa", "nav?name=hoa"));
            leftnav.add(new Field("Trơn", "nav?name=trơn"));
            leftnav.add(new Field("Nơ", "nav?name=nơ"));
            leftnav.add(new Field("Caro", "nav?name=caro"));
            leftnav.add(new Field("Từ 10.000 - 15.000 VND", "nav?from=10000&to=14000"));
            leftnav.add(new Field("Từ 15.000 - 30.000 VND", "nav?from=15000&to=30000"));
        } else if (cid == 3) {
            leftnav.add(new Field("Hình trái tim", "nav?name=tim"));
            leftnav.add(new Field("Hình hoa", "nav?name=hoa"));
            leftnav.add(new Field("Hình ngôi sao", "nav?name=sao"));
            leftnav.add(new Field("Ngọc trai", "nav?name=ngọc"));
            leftnav.add(new Field("Dưới 50.000 VND", "nav?to=49000"));
            leftnav.add(new Field("Trên 50.000 VND", "nav?from=50000"));
        }

        String cname = "";
        
        if (cid == 1) {
            cname = "Túi Tote";
        } else if (cid == 2) {
            cname = "Dây buộc tóc";
        } else if (cid == 3) {
            cname = "Vòng cổ";
        }
        else if (cid == 0) {
            cname = "Tất cả các sản phẩm";
        }

        if (cid == 0) {
            list = pd.getAllProducts();
        } 
        else if (searchProducts != null) list = searchProducts;
        else {
            list = pd.getProducts(cid, name, from, to,oid);
        }

        request.setAttribute("cname", cname);
        request.setAttribute("cid", cid);
        request.setAttribute("list", list);
        request.setAttribute("leftnav", leftnav);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
