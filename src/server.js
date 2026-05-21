// Import Express framework
const express = require('express');

// Create the app and configure the port
const app = express();
const PORT = process.env.PORT || 3000;
const startTime = Date.now();

// Health check endpoint - returns system status

app.get('/health', (req, res) => {
  res.status(500).json({ status: 'broken' });
});



app.get('/info', (req, res) => {
  res.json({
    name: 'health-api',
    description: 'A health check API with automated container publishing'
  });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Health API running on port ${PORT}`);
});
