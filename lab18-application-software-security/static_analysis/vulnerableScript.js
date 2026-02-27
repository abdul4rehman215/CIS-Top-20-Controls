// vulnerableScript.js
// Intentionally insecure examples for linting practice.

function renderUserInput(userInput) {
  // XSS risk: directly injecting user-controlled input into HTML
  document.getElementById("output").innerHTML = userInput;
}

function runDynamicCode(codeFromUser) {
  // Dangerous: eval executes arbitrary JS
  eval(codeFromUser);
}

function insecureRedirect(url) {
  // Potential open redirect pattern (context dependent)
  window.location = url;
}

// Unused variable (style issue)
const debugMode = true;

// Example call
renderUserInput("<img src=x onerror=alert('XSS')>");
