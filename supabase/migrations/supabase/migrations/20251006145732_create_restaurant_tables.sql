/*
  # Restaurant Website Database Schema

  ## Overview
  Creates tables for managing restaurant website data including menu items, reservations, and gallery images.

  ## New Tables
  
  ### `menu_items`
  Stores restaurant menu items with categories and pricing
  - `id` (uuid, primary key) - Unique identifier for each menu item
  - `name` (text) - Name of the dish
  - `description` (text) - Detailed description of the dish
  - `price` (numeric) - Price of the item
  - `category` (text) - Category (appetizers, mains, desserts, beverages)
  - `image_url` (text) - URL to dish image
  - `is_available` (boolean) - Whether item is currently available
  - `created_at` (timestamptz) - Creation timestamp

  ### `reservations`
  Manages customer table reservations
  - `id` (uuid, primary key) - Unique identifier for reservation
  - `name` (text) - Customer name
  - `email` (text) - Customer email
  - `phone` (text) - Customer phone number
  - `date` (date) - Reservation date
  - `time` (text) - Reservation time slot
  - `guests` (integer) - Number of guests
  - `special_requests` (text) - Any special requirements
  - `status` (text) - Status (pending, confirmed, cancelled)
  - `created_at` (timestamptz) - Creation timestamp

  ### `gallery_images`
  Stores restaurant photo gallery
  - `id` (uuid, primary key) - Unique identifier
  - `title` (text) - Image title
  - `image_url` (text) - URL to image
  - `category` (text) - Category (food, interior, ambiance)
  - `display_order` (integer) - Order for displaying images
  - `created_at` (timestamptz) - Creation timestamp

  ## Security
  - Enable Row Level Security on all tables
  - Public read access for menu_items and gallery_images
  - Public insert access for reservations
  - Authenticated admin access for managing content
*/

-- Create menu_items table
CREATE TABLE IF NOT EXISTS menu_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL,
  category text NOT NULL,
  image_url text,
  is_available boolean DEFAULT true,
  created_at timestamptz DEFAULT now()
);

-- Create reservations table
CREATE TABLE IF NOT EXISTS reservations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  date date NOT NULL,
  time text NOT NULL,
  guests integer NOT NULL,
  special_requests text DEFAULT '',
  status text DEFAULT 'pending',
  created_at timestamptz DEFAULT now()
);

-- Create gallery_images table
CREATE TABLE IF NOT EXISTS gallery_images (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  image_url text NOT NULL,
  category text NOT NULL,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE menu_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE reservations ENABLE ROW LEVEL SECURITY;
ALTER TABLE gallery_images ENABLE ROW LEVEL SECURITY;

-- RLS Policies for menu_items
CREATE POLICY "Anyone can view menu items"
  ON menu_items FOR SELECT
  USING (true);

CREATE POLICY "Authenticated users can insert menu items"
  ON menu_items FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update menu items"
  ON menu_items FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- RLS Policies for reservations
CREATE POLICY "Anyone can create reservations"
  ON reservations FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Authenticated users can view reservations"
  ON reservations FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Authenticated users can update reservations"
  ON reservations FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- RLS Policies for gallery_images
CREATE POLICY "Anyone can view gallery images"
  ON gallery_images FOR SELECT
  USING (true);

CREATE POLICY "Authenticated users can insert gallery images"
  ON gallery_images FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update gallery images"
  ON gallery_images FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Insert sample menu items
INSERT INTO menu_items (name, description, price, category, image_url) VALUES
('Bruschetta', 'Grilled bread topped with fresh tomatoes, basil, and mozzarella', 12.99, 'appetizers', 'https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Caesar Salad', 'Crisp romaine lettuce with parmesan, croutons, and Caesar dressing', 14.99, 'appetizers', 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Grilled Salmon', 'Fresh Atlantic salmon with lemon butter sauce and seasonal vegetables', 32.99, 'mains', 'https://images.pexels.com/photos/1516415/pexels-photo-1516415.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Beef Tenderloin', 'Prime beef tenderloin with truffle mashed potatoes and red wine reduction', 45.99, 'mains', 'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Margherita Pizza', 'Wood-fired pizza with San Marzano tomatoes, fresh mozzarella, and basil', 18.99, 'mains', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Tiramisu', 'Classic Italian dessert with espresso-soaked ladyfingers and mascarpone', 9.99, 'desserts', 'https://images.pexels.com/photos/6880219/pexels-photo-6880219.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Chocolate Lava Cake', 'Warm chocolate cake with molten center, served with vanilla ice cream', 11.99, 'desserts', 'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Espresso', 'Rich Italian espresso', 4.50, 'beverages', 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800'),
('House Wine', 'Selection of red and white wines from our cellar', 12.00, 'beverages', 'https://images.pexels.com/photos/1407846/pexels-photo-1407846.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Insert sample gallery images
INSERT INTO gallery_images (title, image_url, category, display_order) VALUES
('Signature Dish', 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1200', 'food', 1),
('Elegant Interior', 'https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=1200', 'interior', 2),
('Fine Dining', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1200', 'food', 3),
('Cozy Ambiance', 'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&w=1200', 'ambiance', 4),
('Fresh Ingredients', 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=1200', 'food', 5),
('Bar Area', 'https://images.pexels.com/photos/941864/pexels-photo-941864.jpeg?auto=compress&cs=tinysrgb&w=1200', 'interior', 6);