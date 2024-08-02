while ($true) {
	Add-Type -TypeDefinition @"
	using System;
	using System.Runtime.InteropServices;
	public class Mouse {
		[DllImport("user32.dll", CallingConvention = CallingConvention.StdCall)]
		public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
		private const int MOUSEEVENTF_MOVE = 0x0001;
		public static void MoveCursor(int x, int y) {
			mouse_event(MOUSEEVENTF_MOVE, x, y, 0, 0);
		}
	}
"@
[Mouse]::MoveCursor(1, 0)
Start-Sleep -Seconds 300
}