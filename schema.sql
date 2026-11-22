-- PortfolioIQ classroom database.
-- Company names and basic descriptions are real.
-- Every simulated_price is an invented USD teaching value.
-- Prices do not represent current or historical market data.
-- Portfolios are classroom examples, not customer investments.

CREATE TABLE IF NOT EXISTS securities (
    symbol          TEXT PRIMARY KEY,
    name            TEXT NOT NULL,
    asset_type      TEXT NOT NULL,
    description     TEXT NOT NULL,
    simulated_price REAL NOT NULL CHECK (simulated_price >= 0)
);

CREATE TABLE IF NOT EXISTS portfolios (
    portfolio_id  TEXT PRIMARY KEY,
    name          TEXT NOT NULL,
    stock_percent INTEGER NOT NULL
                  CHECK (stock_percent BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS change_requests (
    number       INTEGER PRIMARY KEY AUTOINCREMENT,
    portfolio_id TEXT NOT NULL,
    new_value    TEXT NOT NULL,
    status       TEXT NOT NULL DEFAULT 'waiting'
);

INSERT OR IGNORE INTO securities (
    symbol, name, asset_type, description, simulated_price
) VALUES
    (
        'AAPL',
        'Apple Inc.',
        'stock',
        'Apple makes iPhone, Mac, and iPad products.',
        100.00
    ),
    (
        'MSFT',
        'Microsoft Corporation',
        'stock',
        'Microsoft provides software, cloud services, and devices.',
        200.00
    ),
    (
        'AMZN',
        'Amazon.com, Inc.',
        'stock',
        'Amazon operates retail stores and provides cloud services through AWS.',
        150.00
    ),
    (
        'GOOGL',
        'Alphabet Inc.',
        'stock',
        'Alphabet is the parent company of Google.',
        125.00
    ),
    (
        'NVDA',
        'NVIDIA Corporation',
        'stock',
        'NVIDIA develops chips, systems, and software for graphics and accelerated computing.',
        175.00
    );

INSERT OR IGNORE INTO portfolios (
    portfolio_id, name, stock_percent
) VALUES
    ('P100', 'Balanced Learning Portfolio', 60),
    ('P101', 'Example Portfolio 20', 20),
    ('P102', 'Example Portfolio 40', 40),
    ('P103', 'Example Portfolio 80', 80),
    ('P104', 'Example Portfolio 100', 100);