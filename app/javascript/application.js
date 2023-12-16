import "@hotwired/turbo-rails"
import "controllers"


console.log("Hello from application.js");

document.addEventListener("DOMContentLoaded", function() {
    const showCommentsButtons = document.querySelectorAll(".show-comments");

    showCommentsButtons.forEach(button => {
        button.addEventListener("click", function() {
            console.log("Button clicked");
            const gameId = this.dataset.gameId;
            const commentForm = document.querySelector(`.comment-form[data-game-id="${gameId}"]`);
            commentForm.style.display = commentForm.style.display === "none" ? "block" : "none";
        });
    });
});

alert("Hello from application.js");
