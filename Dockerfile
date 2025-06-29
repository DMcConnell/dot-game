FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the app
RUN npm run build

# Expose port 4173 (Vite preview default)
EXPOSE 4173

# Start the preview server
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]