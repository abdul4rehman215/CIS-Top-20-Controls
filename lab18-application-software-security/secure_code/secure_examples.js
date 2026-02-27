// secure_examples.js
// Demonstration of secure coding practices for SQLi + XSS mitigation.

// --- SQL Injection Mitigation (Parameterized Query Example) ---
// Instead of string concatenation:
// "SELECT * FROM users WHERE id = " + userId
// Use parameterized query:
function getUserById(connection, userId) {
  connection.query(
    "SELECT * FROM users WHERE id = ?",
    [userId],
    function (error, results) {
      if (error) {
        console.error("DB error:", error);
        return;
      }
      console.log("Query results:", results);
    }
  );
}

// --- XSS Protection (Sanitization Example using DOMPurify) ---
// Note: In a real web app, DOMPurify is used in the browser.
function renderSafeUserInput(DOMPurify, userInput) {
  const clean = DOMPurify.sanitize(userInput);
  document.getElementById("output").textContent = clean; // safer than innerHTML
  return clean;
}
