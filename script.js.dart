// ============================
// 🌫 HUMO DE CAFÉ ANIMADO
// ============================
const canvas = document.getElementById("coffeeSteam");
const ctx = canvas.getContext("2d");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let particles = [];

class Steam {
  constructor() {
    this.x = canvas.width / 2 + (Math.random() * 120 - 60);
    this.y = canvas.height - 30;
    this.size = Math.random() * 18 + 8;
    this.speed = Math.random() * 0.4 + 0.2;
    this.opacity = Math.random() * 0.4 + 0.1;
  }

  update() {
    this.y -= this.speed;
    this.x += Math.sin(this.y * 0.015) * 0.4;
    this.opacity -= 0.0015;
  }

  draw() {
    ctx.beginPath();
    ctx.fillStyle = `rgba(255,255,255,${this.opacity})`;
    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
    ctx.fill();
  }
}

function createSteam() {
  if (particles.length < 70) {
    particles.push(new Steam());
  }
}

function animateSteam() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  particles.forEach((p, i) => {
    p.update();
    p.draw();

    if (p.opacity <= 0) particles.splice(i, 1);
  });

  createSteam();
  requestAnimationFrame(animateSteam);
}

animateSteam();

window.addEventListener("resize", () => {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
});

// ============================
// 🌑 MODO OSCURO
// ============================
const modoBtn = document.getElementById("modoOscuroBtn");
// nota: esta línea causará un error si no existe el botón en el HTML. Se mantiene por si lo añades luego.
// modoBtn.addEventListener("click", () => {
//   document.body.classList.toggle("dark-mode");
// });

// ============================
// 🌈 ANIMACIONES AL HACER SCROLL
// ============================
// Solo apunta a los elementos que tienen animación inicial, como las tarjetas de episodios
const elementos = document.querySelectorAll(
  ".card-episodio"
);

function showOnScroll() {
  const scrollY = window.scrollY + window.innerHeight - 50;

  elementos.forEach(el => {
    if (el.offsetTop < scrollY) {
      el.classList.add("visible");
    }
  });
}

window.addEventListener("scroll", showOnScroll);
showOnScroll();

// ============================
// ⭐ SLIDER DE TESTIMONIOS (Deshabilitado en la corrección anterior, se mantiene inactivo)
// ============================
/*
let index = 0;
const slides = document.querySelectorAll(".slide");

setInterval(() => {
  slides[index].classList.remove("active");
  index = (index + 1) % slides.length;
  slides[index].classList.add("active");
}, 3000);
*/

// ============================
// 📬 EFECTO BURBUJAS FORMULARIO
// ============================
const form = document.querySelector("form");

form.addEventListener("submit", () => {
  for (let i = 0; i < 12; i++) {
    let b = document.createElement("span");
    b.classList.add("burbuja");
    form.appendChild(b);

    setTimeout(() => b.remove(), 2000);
  }

  alert("¡Gracias por tu idea, crack! ☕✨");
});