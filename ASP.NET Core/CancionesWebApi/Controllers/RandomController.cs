using CancionesWebApi.Data;
using CancionesWebApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CancionesWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RandomController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RandomController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<Cancion>> GetCancion()
        {

            var list = await _context.Cancion.ToListAsync();

            var max = list.Count;
            int index = new Random().Next(0, max);

            var cancion = list[index];

            if (cancion == null)
            {
                return NoContent();
            }

            return cancion;
        }
    }
}
