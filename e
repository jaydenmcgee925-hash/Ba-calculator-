:root {
  --bg: #0b0c10;
  --card: #12141a;
  --muted: #98a2b3;
  --text: #e5e7eb;
  --accent: #7c3aed;
  --danger: #ef4444;
  --ring: #7c3aed55;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  font-family: Inter, system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Apple Color Emoji","Segoe UI Emoji";
  background: radial-gradient(1200px 600px at 20% -10%, #1b1f2f 0, #0b0c10 60%);
  color: var(--text);
}

.container {
  max-width: 980px;
  margin: 48px auto;
  padding: 0 16px;
}

header h1 { margin: 0 0 6px; letter-spacing: 0.3px; }
.sub { color: var(--muted); margin: 0 0 24px; }

.card {
  background: var(--card);
  border: 1px solid #202636;
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 10px 30px rgba(0,0,0,.25);
}

.grid { display: grid; gap: 24px; grid-template-columns: 1fr 1fr; }
@media (max-width: 880px){ .grid { grid-template-columns: 1fr; } }

.pane h2, .pane h3 { margin: 0 0 12px; }
.pane h3 { margin-top: 18px; color: #cbd5e1; font-weight: 600; }

label {
  display: block;
  margin: 10px 0 12px;
  font-size: 14px;
  color: #cbd5e1;
}

input {
  margin-top: 6px;
  width: 100%;
  padding: 10px 12px;
  background: #0d1117;
  color: var(--text);
  border: 1px solid #1f2432;
  border-radius: 10px;
  outline: none;
}
input:focus { border-color: var(--accent); box-shadow: 0 0 0 4px var(--ring); }

.row { display: grid; gap: 12px; grid-template-columns: 1fr 1fr; }
@media (max-width: 600px){ .row { grid-template-columns: 1fr; } }

.kv { display: grid; gap: 10px; }
.kv > div {
  display: flex; align-items: center; justify-content: space-between;
  padding: 10px 12px; background: #0d1117; border: 1px solid #1f2432; border-radius: 10px;
}
.kv span { color: var(--muted); font-size: 14px; }
.kv strong { font-variant-numeric: tabular-nums; }

.btn {
  margin-top: 16px;
  padding: 10px 14px;
  border: 1px solid #2c2f3b;
  background: linear-gradient(180deg, #7c3aed, #6d28d9);
  color: white;
  border-radius: 10px;
  cursor: pointer;
  font-weight: 600;
}
.btn:hover { filter: brightness(1.05); }

.error {
  margin-top: 8px;
  padding: 10px 12px;
  background: #2a0e10;
  border: 1px solid #3f1a1c;
  color: #fecaca;
  border-radius: 8px;
}

.copied { margin-top: 8px; color: #a7f3d0; }
footer { margin-top: 16px; color: var(--muted); }
