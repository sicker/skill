Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
    [DllImport("user32.dll")]
    public static extern IntPtr GetDesktopWindow();
    [DllImport("user32.dll")]
    public static extern IntPtr GetWindow(IntPtr hWnd, uint uCmd);
}
"@

$shell = New-Object -ComObject "Shell.Application"
$shell.Windows() | ForEach-Object {
    $hWnd = [IntPtr]$_.HWND
    [Win32]::SetWindowPos($hWnd, 0, 100, 100, 800, 600, 0x0040)
}
