import type { NextConfig } from "next";
import createMDX from "@next/mdx";

const nextConfig: NextConfig = {
  // Configure `pageExtensions` to include markdown and mdx files
  pageExtensions: ["js", "jsx", "md", "mdx", "ts", "tsx"],
  // Add headers to serve script files as plain text so they don't download
  async headers() {
    return [
      {
        source: "/scripts/:path*",
        headers: [
          {
            key: "Content-Type",
            value: "text/plain; charset=utf-8",
          },
        ],
      },
    ];
  },
};

const withMDX = createMDX({
  // Add markdown plugins here, as desired
});

// Wrap Next.js config with MDX config
export default withMDX(nextConfig);
