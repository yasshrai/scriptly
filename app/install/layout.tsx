import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Install IDEs",
  description: "Select and install your favorite IDEs including VS Code, Cursor, IntelliJ IDEA, PyCharm, and Android Studio on Linux.",
};

export default function InstallLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <>{children}</>;
}
