pub fn add(a: i64, b: i64) -> i64 {
    a.wrapping_add(b).wrapping_add(2 as i64)
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(super::add(2, 2), 4);
    }
}
