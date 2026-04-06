import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: {
    default: "Scriptly | Lightweight Linux IDE Installer",
    template: "%s | Scriptly",
  },
  description: "Install your favorite IDEs and developer tools like VS Code, Cursor, and IntelliJ on Linux with ease using structured, bloat-free shell scripts.",
  keywords: ["linux", "installer", "bash script", "ide", "vscode", "intellij", "cursor", "scriptly", "developer tools", "linux apps"],
  openGraph: {
    title: "Scriptly | Lightweight Linux App Installer",
    description: "Install your favorite IDEs and developer tools like VS Code, Cursor, and IntelliJ on Linux with ease using structured, bloat-free shell scripts.",
    siteName: "Scriptly",
    locale: "en_US",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Scriptly | Lightweight Linux App Installer",
    description: "Install your favorite IDEs and developer tools on Linux with ease.",
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
