using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Runtime.InteropServices;
using System.Reflection;
using System.Security.Permissions;

namespace W
{
    public partial class B 
    {    
        internal ArrayList availablePlugins;
        internal ArrayList loadedPlugins;
        internal void queryAvailablePlugin()
        {
            loadedPlugins = new ArrayList();
            availablePlugins = new ArrayList();
            DirectoryInfo d = new DirectoryInfo(Directory.GetCurrentDirectory());
            foreach (FileInfo f in d.GetFiles("Whiteboard_*.dll", SearchOption.TopDirectoryOnly))
            {
                availablePlugins.Add(f.Name.Split('.')[0].Split('_')[1]);
            }
            if(autoLoadPlugins)
            {
                foreach (string s in availablePlugins)
                {
                    loadPlugin(s);
                }
            }
        }
        
        [PermissionSetAttribute(SecurityAction.Demand, Name = "FullTrust")]
        public bool loadPlugin(string args)
        {
            string argss = "Whiteboard_";
            argss += args;
            Assembly a = Assembly.Load(argss);
            Type[] mytypes = a.GetTypes();
            BindingFlags flags = (BindingFlags.NonPublic | BindingFlags.Public |
            BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly);
            foreach (Type t in mytypes)
            {
                    MethodInfo[] mi = t.GetMethods(flags); 
                    foreach (MethodInfo m in mi)
                    {
                        // Instead of invoking the methods,
                        // it's safer to initially just list them.
                        if (m.Name == "Load")
                        {
                            Object plugin = Activator.CreateInstance(t);
                            IPlugin plugin_ = (IPlugin)plugin;
                            object[] os = new object[1];
                            os[0] = this;
                            m.Invoke(plugin, os);
                            plugin_.Name = args;
                            this.loadedPlugins.Add(plugin_);
                            return true;
                        }
                    } 
            }
            return false;
        }
        public void UnloadPlugin(string args)
        {
            IPlugin pl = null;
            foreach (IPlugin p in loadedPlugins)
            {
                if (p.Name == args)
                {
                    pl = p;
                    break;
                }
            }
            if(pl != null)
            {
                pl.UnLoad();
                loadedPlugins.Remove(pl);
            }
        }
    }
}
