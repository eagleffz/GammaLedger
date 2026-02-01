const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 8080;
const DATA_DIR = path.join(__dirname, 'data');
const STORAGE_FILE = path.join(DATA_DIR, 'storage.json');

// Middleware
app.use(cors());
app.use(bodyParser.json({ limit: '50mb' }));
app.use(express.static(path.join(__dirname, 'src')));

// Ensure data directory exists
if (!fs.existsSync(DATA_DIR)) {
    fs.mkdirSync(DATA_DIR, { recursive: true });
}

// Initialize storage file if it doesn't exist
if (!fs.existsSync(STORAGE_FILE)) {
    fs.writeFileSync(STORAGE_FILE, JSON.stringify({
        version: '1.0',
        timestamp: new Date().toISOString(),
        trades: []
    }, null, 2));
}

// API Routes
app.get('/api/storage', (req, res) => {
    try {
        if (fs.existsSync(STORAGE_FILE)) {
            const data = fs.readFileSync(STORAGE_FILE, 'utf8');
            res.json(JSON.parse(data));
        } else {
            res.json({});
        }
    } catch (error) {
        console.error('Error reading storage:', error);
        res.status(500).json({ error: 'Failed to read storage' });
    }
});

app.post('/api/storage', (req, res) => {
    try {
        const data = req.body;
        fs.writeFileSync(STORAGE_FILE, JSON.stringify(data, null, 2));
        res.json({ success: true, timestamp: new Date().toISOString() });
    } catch (error) {
        console.error('Error writing storage:', error);
        res.status(500).json({ error: 'Failed to write storage' });
    }
});

// Serve index.html for all other routes (SPA support if needed, though mostly static here)
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'src', 'index.html'));
});

// Start server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
    console.log(`Storage file: ${STORAGE_FILE}`);
});
