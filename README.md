# Bitcoin Price Monitor

A real-time Bitcoin price monitoring dashboard built with Ruby on Rails. This application fetches Bitcoin prices from the CoinGecko API, stores them in a database, and displays them in a beautiful, responsive interface with real-time updates.

## Features

- Real-time Bitcoin price updates every 10 seconds
- 24-hour price change percentage
- Interactive price chart showing last 30 data points
- Responsive design using Tailwind CSS
- Real-time updates using JavaScript
- Error handling and fallback mechanisms

## Prerequisites

- Ruby 3.2.2 or higher
- Rails 8.0.2
- SQLite3
- Node.js (for asset compilation)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/bitcoin_monitor.git
cd bitcoin_monitor
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
rails db:create db:migrate db:seed
```

4. Start the Rails server:
```bash
rails server
```

5. Visit `http://localhost:3000` in your browser

## Project Structure

```
bitcoin_monitor/
├── app/
│   ├── controllers/
│   │   └── bitcoin_controller.rb    # Handles price fetching and API responses
│   ├── models/
│   │   └── bitcoin.rb              # Bitcoin model with price fetching logic
│   └── views/
│       └── home/
│           └── index.html.erb      # Main dashboard view
├── db/
│   └── migrate/
│       └── YYYYMMDDHHMMSS_create_bitcoins_table.rb  # Database schema
└── config/
    └── routes.rb                   # Application routes
```

## Database Schema

The application uses a single table `bitcoins` with the following structure:
- `price`: decimal (precision: 20, scale: 8)
- `timestamp`: datetime
- `created_at`: datetime
- `updated_at`: datetime

## API Integration

The application fetches Bitcoin prices from the CoinGecko API:
- Endpoint: `https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd`
- Updates every 10 seconds
- Includes error handling and fallback mechanisms

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- CoinGecko API for providing Bitcoin price data
- Tailwind CSS for the beautiful UI
- Chart.js for the interactive charts
