import express from "express";
import http from "http";
import { Server } from "socket.io";
import cors from "cors";

const app = express();
app.use(cors());

const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});

io.on("connection", (socket) => {
  console.log("User connected:", socket.id);

  socket.on("send_message", (data) => {
    console.log("Message received:", data);
    io.emit("receive_message", data);
  });

  socket.on("typing", (userId) => {
    socket.broadcast.emit("typing", userId);
  });

  socket.on("stop_typing", (userId) => {
    socket.broadcast.emit("stop_typing", userId);
  });

  socket.on("disconnect", () => {
    console.log("User disconnected:", socket.id);
  });
});

// ✅ Improved Random Stock Data Generator
// const generateStockData = () => {
//   const basePrice = Math.random() * (300 - 100) + 100; // Base price between 100-300
//   const volatility = Math.random() * 10 + 5; // Ensures bigger candle range (5-15)

//   let open = Number(
//     (basePrice + Math.random() * volatility - volatility / 2).toFixed(2)
//   );
//   let close = Number(
//     (basePrice + Math.random() * volatility - volatility / 2).toFixed(2)
//   );

//   let high = Number(
//     (Math.max(open, close) + Math.random() * volatility).toFixed(2)
//   );
//   let low = Number(
//     (Math.min(open, close) - Math.random() * volatility).toFixed(2)
//   );

//   return {
//     code: "AAPL.US",
//     timestamp: Date.now(),
//     gmtoffset: 0,
//     open,
//     high,
//     low,
//     close,
//     volume: Math.floor(Math.random() * 5000000) + 1000000, // 1M to 5M
//     previousClose: basePrice.toFixed(2),
//     change: (close - open).toFixed(4),
//     change_p: (((close - open) / open) * 100).toFixed(2),
//   };
// };

const generateStockData = () => {
  const basePrice = Math.random() * (300 - 100) + 100; // Base price between 100-300
  const volatility = Math.random() * 0.5 + 0.2; // 🔥 Lower volatility (0.2-0.7)

  let open = Number(
    (basePrice + Math.random() * volatility - volatility / 2).toFixed(2)
  );
  let close = Number(
    (open + Math.random() * volatility - volatility / 2).toFixed(2)
  );

  let high = Number((Math.max(open, close) + Math.random() * 0.3).toFixed(2)); // 🔥 Max +0.3
  let low = Number((Math.min(open, close) - Math.random() * 0.3).toFixed(2)); // 🔥 Max -0.3

  return {
    code: "AAPL.US",
    timestamp: Date.now(),
    gmtoffset: 0,
    open,
    high,
    low,
    close,
    volume: Math.floor(Math.random() * 500000) + 200000, // 🔥 Smaller volume (200K - 500K)
    previousClose: basePrice.toFixed(2),
    change: (close - open).toFixed(4),
    change_p: (((close - open) / open) * 100).toFixed(2),
  };
};

let dataCount = 0;
let isSkipping = false;
let skipDuration = 10; //? Number of data points to skip (5 seconds at 2 updates/sec)

setInterval(() => {
  if (isSkipping) {
    if (dataCount >= skipDuration) {
      console.log("Resuming stock data updates.");
      dataCount = 0;
      isSkipping = false;
    } else {
      console.log(`Skipping stock data (${dataCount + 1}/${skipDuration})...`);
      dataCount++;
      return;
    }
  } else {
    if (dataCount < 20) {
      const stockData = generateStockData();
      io.emit("stock_update", stockData);
      console.log("Sent stock data:", stockData);
      dataCount++;
    } else {
      //? After 20 updates, randomly decide to skip
      if (Math.random() < 0.5) {
        // 50% chance to start skipping
        console.log("Randomly starting a 10-second data gap...");
        isSkipping = true;
        dataCount = 0;
      } else {
        dataCount = 0;
      }
    }
  }
}, 500); // 2 updates per second

server.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
