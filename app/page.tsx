import Image from "next/image";
import { SiGithub, SiIntellijidea, SiPycharm, SiAndroidstudio, } from "react-icons/si";
import { VscVscode } from "react-icons/vsc";
import { VscTerminalBash, VscCloudDownload, VscPackage, VscShield } from "react-icons/vsc";

export default function Home() {
  return (
    <div className="flex min-h-screen flex-col items-center bg-black selection:bg-white selection:text-black">
      {/* Navigation */}
      <nav className="fixed top-0 z-50 flex w-full max-w-5xl items-center justify-between px-6 py-6 backdrop-blur-md">
        <div className="flex items-center gap-2">
          <Image
            src="/logo.png"
            alt="Scriptly Logo"
            width={32}
            height={32}
            className="rounded-lg"
          />
          <span className="text-xl font-bold tracking-tight text-white font-sans">Scriptly</span>
        </div>
        <div className="flex gap-6 text-sm font-medium text-muted hover:text-foreground">
          <a href="https://github.com/yasshrai/scriptly" target="_blank" className="flex items-center gap-2 transition-colors hover:text-white">
            <SiGithub className="h-5 w-5" />
            GitHub
          </a>
        </div>
      </nav>

      <main className="flex w-full flex-col items-center px-6 pt-32 sm:pt-48">
        {/* Hero Section */}
        <section className="flex max-w-3xl flex-col items-center text-center">
          <div className="mb-4 inline-flex items-center rounded-full border border-border bg-zinc-900/50 px-3 py-1 text-xs font-medium text-muted">
            <span className="mr-2 flex h-2 w-2 rounded-full bg-blue-500 animate-pulse"></span>
            Now supporting VS Code
          </div>
          <h1 className="text-5xl font-extrabold tracking-tight sm:text-7xl">
            Install apps on Linux, <br />
            <span className="bg-gradient-to-r from-zinc-200 to-zinc-500 bg-clip-text text-transparent">
              the clean way.
            </span>
          </h1>
          <p className="mt-8 max-w-xl text-lg text-muted leading-relaxed font-sans">
            Scriptly is a lightweight Linux utility for installing applications using structured shell scripts. No bloat, just official sources.
          </p>
          <div className="mt-10 flex flex-col gap-4 sm:flex-row">
            <a
              href="#install"
              className="flex h-12 items-center justify-center rounded-full bg-white px-8 text-sm font-bold text-black transition-transform hover:scale-105 active:scale-95"
            >
              Get Started
            </a>
            <a
              href="https://github.com/yasshrai/scriptly"
              target="_blank"
              className="flex h-12 items-center justify-center rounded-full border border-border bg-zinc-900/50 px-8 text-sm font-bold transition-colors hover:bg-zinc-900"
            >
              View Repository
            </a>
          </div>
        </section>

        {/* Support Section */}
        <section className="mt-32 w-full max-w-5xl border-t border-border pt-24">
          <div className="grid gap-12 sm:grid-cols-2">
            <div>
              <h2 className="text-2xl font-bold tracking-tight">Current Support</h2>
              <p className="mt-2 text-muted">Reliable installations from official sources.</p>
              <div className="mt-6 flex flex-wrap gap-3">
                <div className="flex items-center gap-3 rounded-xl border border-border bg-zinc-900/30 p-4 transition-colors hover:bg-zinc-900/50">
                  <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-zinc-800">
                    <VscVscode className="h-6 w-6 text-[#007ACC]" />
                  </div>
                  <div>
                    <p className="font-semibold text-white">VS Code</p>
                    <p className="text-xs text-muted font-sans">Linux x64</p>
                  </div>
                </div>
              </div>
            </div>
            <div>
              <h2 className="text-2xl font-bold tracking-tight text-white">Future Plans</h2>
              <p className="mt-2 text-muted font-sans">Expanding the collection of supported tools.</p>
              <div className="mt-6 grid grid-cols-2 gap-4">
                {[
                  { name: "IntelliJ IDEA", icon: SiIntellijidea, color: "#FE315D" },
                  { name: "PyCharm", icon: SiPycharm, color: "#21D789" },
                  { name: "Android Studio", icon: SiAndroidstudio, color: "#3DDC84" },
                  { name: "Dev Tools", icon: VscTerminalBash, color: "#FFFFFF" },
                ].map((item, i) => (
                  <div key={i} className="flex items-center gap-2 text-sm text-muted font-sans">
                    <item.icon className="h-4 w-4" style={{ color: item.color }} />
                    {item.name}
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Requirements */}
        <section className="mt-32 w-full max-w-5xl">
          <div className="rounded-3xl border border-border bg-gradient-to-b from-zinc-900/50 to-black p-8 sm:p-12">
            <h2 className="text-3xl font-bold tracking-tight text-white">Requirements</h2>
            <div className="mt-8 grid gap-4 sm:grid-cols-4">
              {[
                { title: "OS", value: "Linux 64-bit", icon: VscShield },
                { title: "Shell", value: "Bash", icon: VscTerminalBash },
                { title: "Tools", value: "curl, tar", icon: VscCloudDownload },
                { title: "Access", value: "sudo privileges", icon: VscPackage },
              ].map((item, i) => (
                <div key={i} className="flex flex-col gap-2 border-l border-zinc-800 pl-4">
                  <item.icon className="h-5 w-5 text-muted" />
                  <span className="text-xs uppercase tracking-widest text-muted font-sans">{item.title}</span>
                  <span className="font-medium text-white">{item.value}</span>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Installation */}
        <section id="install" className="mt-32 w-full max-w-3xl pb-32">
          <h2 className="text-center text-4xl font-bold tracking-tight text-white">Installation</h2>
          <p className="mt-4 text-center text-muted font-sans">Clone the repository and run the scripts directly.</p>

          <div className="mt-12 space-y-6">
            <div className="group relative">
              <div className="mb-2 text-sm font-medium text-muted font-sans">1. Clone the repository</div>
              <div className="flex items-center justify-between rounded-xl border border-border bg-zinc-950 p-4 font-mono text-sm transition-colors group-hover:bg-zinc-900/50">
                <code className="text-zinc-300">git clone https://github.com/yasshrai/scriptly</code>
              </div>
            </div>

            <div className="group relative">
              <div className="mb-2 text-sm font-medium text-muted font-sans">2. Navigate to scripts</div>
              <div className="flex items-center justify-between rounded-xl border border-border bg-zinc-950 p-4 font-mono text-sm transition-colors group-hover:bg-zinc-900/50">
                <code className="text-zinc-300">cd scriptly/scripts</code>
              </div>
            </div>

            <div className="group relative">
              <div className="mb-2 text-sm font-medium text-muted font-sans">3. Make the script executable</div>
              <div className="flex items-center justify-between rounded-xl border border-border bg-zinc-950 p-4 font-mono text-sm transition-colors group-hover:bg-zinc-900/50">
                <code className="text-zinc-300">chmod +x installvscode.sh</code>
              </div>
            </div>

            <div className="group relative">
              <div className="mb-2 text-sm font-medium text-muted font-sans">4. Run the installer</div>
              <div className="flex items-center justify-between rounded-xl border border-border bg-zinc-950 p-4 font-mono text-sm transition-colors group-hover:bg-zinc-900/50">
                <code className="text-zinc-300">./installvscode.sh</code>
              </div>
            </div>
          </div>

          <div className="mt-12 rounded-2xl bg-zinc-900/30 p-6 text-center text-sm text-muted font-sans border border-border">
            <p>Each script is standalone and handles dependencies, extraction, and symlinking automatically.</p>
          </div>
        </section>
      </main>

      {/* Footer */}
      <footer className="w-full border-t border-border py-12 text-center text-sm text-muted font-sans">
        <p>© {new Date().getFullYear()} Scriptly. Built for Linux power users.</p>
      </footer>
    </div>
  );
}
