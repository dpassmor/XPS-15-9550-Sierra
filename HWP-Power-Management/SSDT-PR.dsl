// inject plugin-type on CPU0 to enable GPU and OS-controlled HWP power management

DefinitionBlock ("ssdt_pr.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00006500)
{
    External (\_PR_.CPU0, DeviceObj)
    External (DTGP, MethodObj)
    
    Scope (\_PR_.CPU0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Debug = "Writing plugin-type to Registry!"
            Local0 = Package (0x02)
                {
                    "plugin-type", 
                    One
                }
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }
}
