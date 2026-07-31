// ============================
// 🌈 ANIMACIONES AL HACER SCROLL
// ============================

const elementos = document.querySelectorAll(".card-episodio");

function showOnScroll() {
  const scrollY = window.scrollY + window.innerHeight - 50;

  elementos.forEach((el) => {
    if (el.offsetTop < scrollY) {
      el.classList.add("visible");
    }
  });
}

if (elementos.length > 0) {
  window.addEventListener("scroll", showOnScroll);
  showOnScroll();
}

// ============================
// 📬 EFECTO FORMULARIO
// ============================

const form = document.querySelector(".form-animado");

if (form) {
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    alert("¡Gracias por escribirnos! ☕ Hemos recibido tu mensaje.");

    form.reset();
  });
}
