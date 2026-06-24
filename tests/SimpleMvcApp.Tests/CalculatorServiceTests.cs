using System;
using Xunit;
using SimpleMvcApp.Web.Services;

namespace SimpleMvcApp.Tests
{
    public class CalculatorServiceTests
    {
        private readonly CalculatorService _service;



        public CalculatorServiceTests()
        {
            _service = new CalculatorService();
        }

        [Theory]
        [InlineData(1,2,3)]
        [InlineData(-1,5,4)]
        public void Add_ReturnsCorrectSum(int a, int b, int expected)
        {
            Assert.Equal(expected, _service.Add(a,b));
        }

        [Theory]
        [InlineData(5,3,2)]
        [InlineData(10,-3,13)]
        public void Subtract_ReturnsCorrectDifference(int a, int b, int expected)
        {
            Assert.Equal(expected, _service.Subtract(a,b));
        }

        [Theory]
        [InlineData(3,4,12)]
        [InlineData(-2,5,-10)]
        public void Multiply_ReturnsCorrectProduct(int a, int b, int expected)
        {
            Assert.Equal(expected, _service.Multiply(a,b));
        }

        [Fact]
        public void Divide_ReturnsCorrectQuotient()
        {
            Assert.Equal(2, _service.Divide(6,3));
        }

        [Fact]
        public void Divide_ByZero_Throws()
        {
            Assert.Throws<DivideByZeroException>(() => _service.Divide(1,0));
        }
    }
}
