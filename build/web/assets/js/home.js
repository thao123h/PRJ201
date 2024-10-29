/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


const modal = document.getElementById("myModal");
const openModalBtn = document.getElementById("openModalBtn");
const closeModal = document.querySelector(".closee");
console.log("Modal element:", modal);
console.log("Open Modal Button:", openModalBtn);
console.log("Close Modal Button:", closeModal);

// Mở modal khi nhấn vào nút
openModalBtn.onclick = function() {
    modal.style.display = "block";
};

// Đóng modal khi nhấn vào biểu tượng "x"
closeModal.onclick = function() {
    modal.style.display = "none";
};

// Đóng modal khi nhấn ra ngoài modal
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};